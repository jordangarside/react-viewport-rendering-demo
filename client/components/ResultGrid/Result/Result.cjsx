root = global ? window

root.reactTrackerDemo.Result = React.createClass
	watcher: {}
	componentDidMount: ->
		item_id = @props.item?._id
		if item_id?
			$item 	= React.findDOMNode(this)
			@watcher = scrollMonitor.create( $item )
			colorDependencyAutorun = undefined

			@watcher.on "enterViewport", () =>
				root.Items.update item_id,
					$set:
						inViewport: true
				colorDependencyAutorun = Tracker.autorun ->
					console.log("@watcher colorDependencyAutorun: activePreference changed...")
					activePreference = root.Preferences.findOne({isActive: true})
					Tracker.nonreactive ->
						root.reactTrackerDemo.Items.checkForUpdates(item_id)
			@watcher.on "exitViewport", () =>
				root.Items.update item_id,
					$set:
						inViewport: false
				colorDependencyAutorun?.stop()
	componentWillUnmount: ->
		if @watcher.destroy?
			@watcher.destroy()
	render: ->
		listItemStyle =
			backgroundColor: @props.item?.activeColor
			display: "inline-block"
			height: 200
			listStyle: "none"
			margin: 15
			width: 300
			transition: "background-color 300ms"
		<li style={listItemStyle} key={@props.item?._id} className="shadow-1">
			{@props.item?.text}
		</li>
