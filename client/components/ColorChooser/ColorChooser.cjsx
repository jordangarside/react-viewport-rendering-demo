root = global ? window

root.reactTrackerDemo.ColorChooser = React.createClass
	mixins: [ReactMeteorData]
	getMeteorData: ->
		activePreference: window.Preferences.findOne({isActive: true})
	changeActivePreference: (event) ->
		color = event.target.innerHTML
		window.reactTrackerDemo.Preferences.createNewPreference(color)
	deleteActivePreference: () ->
		window.reactTrackerDemo.Preferences.removeActivePreference()
	render: ->
		containerStyle =
			backgroundColor: "white"
			border: "1px solid black"
			position: "fixed"
			right: 20
			top: 20
			width: 150
		listItemStyle =
			listStyle: "none"
			padding: 10
		<div className="colorChooserContainer" style={containerStyle}>
			<ul>
				<li style={listItemStyle} onClick={@changeActivePreference}>black</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>ghostwhite</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>crimson</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>lawngreen</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>deepskyblue</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>violet</li>
				<li style={listItemStyle} onClick={@changeActivePreference}>deeppink</li>
			</ul>
			{<li style={listItemStyle} onClick={@deleteActivePreference}>delete active preference</li> if @data.activePreference}
		</div>
