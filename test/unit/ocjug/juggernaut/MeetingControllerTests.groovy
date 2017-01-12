package ocjug.juggernaut



import org.junit.*
import grails.test.mixin.*

@TestFor(MeetingController)
@Mock(Meeting)
class MeetingControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/meeting/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.meetingInstanceList.size() == 0
        assert model.meetingInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.meetingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.meetingInstance != null
        assert view == '/meeting/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/meeting/show/1'
        assert controller.flash.message != null
        assert Meeting.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/meeting/list'


        populateValidParams(params)
        def meeting = new Meeting(params)

        assert meeting.save() != null

        params.id = meeting.id

        def model = controller.show()

        assert model.meetingInstance == meeting
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/meeting/list'


        populateValidParams(params)
        def meeting = new Meeting(params)

        assert meeting.save() != null

        params.id = meeting.id

        def model = controller.edit()

        assert model.meetingInstance == meeting
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/meeting/list'

        response.reset()


        populateValidParams(params)
        def meeting = new Meeting(params)

        assert meeting.save() != null

        // test invalid parameters in update
        params.id = meeting.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/meeting/edit"
        assert model.meetingInstance != null

        meeting.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/meeting/show/$meeting.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        meeting.clearErrors()

        populateValidParams(params)
        params.id = meeting.id
        params.version = -1
        controller.update()

        assert view == "/meeting/edit"
        assert model.meetingInstance != null
        assert model.meetingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/meeting/list'

        response.reset()

        populateValidParams(params)
        def meeting = new Meeting(params)

        assert meeting.save() != null
        assert Meeting.count() == 1

        params.id = meeting.id

        controller.delete()

        assert Meeting.count() == 0
        assert Meeting.get(meeting.id) == null
        assert response.redirectedUrl == '/meeting/list'
    }
}
