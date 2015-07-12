if Meteor.isClient
	window.reactTrackerDemo 			?= {}
	window.reactTrackerDemo.Preferences	= {}

	window.Preferences = new Mongo.Collection(null)

	window.reactTrackerDemo.Preferences.createNewPreference = (color) ->
		activePreference = window.Preferences.findOne({isActive: true})

		window.Preferences.insert
			color: color
			date: new Date()
			isActive: true

		if activePreference?
			window.Preferences.update activePreference._id,
				$set:
					isActive: false

	window.reactTrackerDemo.Preferences.removeActivePreference = ->
		activePreference = window.Preferences.findOne({isActive: true})
		window.Preferences.remove(activePreference._id)
