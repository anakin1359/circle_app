import React from "react"
import PropTypes from "prop-types"
class HelloMessage extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

HelloMessage.propTypes = {
  greeting: PropTypes.string
};
export default HelloMessage
