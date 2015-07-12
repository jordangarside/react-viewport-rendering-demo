root = global ? window

root.reactTrackerDemo.ResultGrid = React.createClass
	mixins: [ReactMeteorData]
	getMeteorData: ->
		results: Items.find().fetch()
	render: ->
		unorderedListStyle =
			padding: 0
			textAlign: "center"
		<div className="resultGridContainer">
			<root.reactTrackerDemo.ColorChooser />
			<ul style={unorderedListStyle}>
				{<root.reactTrackerDemo.Result item={@data.results[i]} /> for i in [0..@data.results.length-1]}
			</ul>
		</div>
