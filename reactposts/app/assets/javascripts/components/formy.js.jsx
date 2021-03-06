var Formy = React.createClass({

  formy(event){
    event.preventDefault();
    var theText = this.refs.convo.value;
    //alert(theText);

    // Instead of alerting, we want to save it

    // POST JSON to an API endpoint

    var theJSON = {
      post: {
        text: theText
      }
    };

    fetch("/api/posts.json", {
      method: 'post',
      headers: {
        "Content-type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(theJSON)
    }).then(function(response){
      return response.json();
    }).then(function(data){
      // refresh the convo list for the room (but it'll refresh soon)
      component.refs.convo.value = "";
    })

  },
  render(){
    return <form onSubmit={this.formy}>

      <label for="convo">Your Glorious Text</label>
      <input type="text" ref="convo"/>

    <button>Click</button>
  </form>
  }
})
