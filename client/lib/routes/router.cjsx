root = global ? window
root.reactTrackerDemo ?= {}

FlowRouter.route '/',
	subscriptions: ->
		console.log("Subscribing...")
		return Meteor.subscribe("readItems", {skip: 0, limit: 1000})
	action: ->
		ReactLayout.render root.reactTrackerDemo.DefaultLayout,
			content: <root.reactTrackerDemo.ResultGrid />
