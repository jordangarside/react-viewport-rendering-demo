root = global ? window

root.reactTrackerDemo.DefaultLayout = React.createClass
	render: ->
		<div>
			<h1> React Viewport Scrolling Demo </h1>
			{this.props.content}
		</div>
