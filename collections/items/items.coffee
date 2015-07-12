root = global ? window

root.Items = new Mongo.Collection("items")
console.log "Items Collection created..."

root.defaultColor = "white"

if Meteor.isServer
	if root.Items.find().count() == 0
		for i in [0..10000]
			root.Items.insert
				text: "item #{i}"
				sequence_id: i
				inViewport: false
				activeColor: root.defaultColor
	Meteor.publish "readItems", (options) ->
		{@skip, @limit} = options
		return Items.find({}, {sort: {sequence_id: 1}, skip: @skip, limit: @limit})

if Meteor.isClient
	window.reactTrackerDemo 		?= {}
	window.reactTrackerDemo.Items 	= {}

	window.reactTrackerDemo.Items.checkForUpdates = (item_id) ->
		activePreference 	= window.Preferences.findOne({isActive: true})
		item 				= window.Items.findOne(item_id)
		if activePreference?
			item = Items.findOne(item_id)
			if activePreference.color != item.activeColor
				window.Items.update item_id,
					$set:
						activeColor: activePreference.color
		else
			window.Items.update item_id,
				$set:
					activeColor: root.defaultColor
