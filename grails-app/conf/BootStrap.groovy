import ocjug.juggernaut.Location
import ocjug.juggernaut.Meeting
import ocjug.juggernaut.Role
import ocjug.juggernaut.User
import ocjug.juggernaut.UserRole

class BootStrap {

    def init = { servletContext ->
		Location.defaultTimeZone = 'America/Los_Angeles'
		environments {
			development {
				// Create test user with admin role
				def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true) 
				def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
				
				def testUser = new User(username: 'me', enabled: true, password: 'password') 
				testUser.save(flush: true)
				
				UserRole.create testUser, adminRole, true
				
				assert User.count() == 1 
				assert Role.count() == 2 
				assert UserRole.count() == 1
				
				// Test data
				Location location = new Location(name: "Smart Soft", street: "18006 Sky Park Circle", unit: "204", city: "Irvine", state: "CA")
				location.save(flush: true, failOnError: true)
				//assert location.id != null
				
				Meeting meeting = new Meeting(title: "Fun with Grails!", speaker: "John Doe", description: "Learn Grails", 
					meetingDate: new Date(), startTime: "6:30 PM", endTime: "8:30 PM", location: location)
				meeting.save(flush: true, failOnError: true)
				assert Meeting.count() == 1
				assert Location.count() == 1
			}
		}
    }
    def destroy = {
    }
}
