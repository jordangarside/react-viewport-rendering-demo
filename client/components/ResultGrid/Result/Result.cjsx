root = global ? window

root.reactTrackerDemo.Result = React.createClass
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
