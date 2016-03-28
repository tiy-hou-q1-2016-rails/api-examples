var PostList = React.createClass({

  fetchPostsTimer: null,

  getInitialState(){
    return {
      posts: []
    }
  },

  componentDidMount(){
    this.fetchPosts();
    this.fetchPostsTimer = setInterval(this.fetchPosts, 3000);
  },

  componentWillUnmount(){
    // Clean up after ourselves to prevent memory leaks
    clearInterval(this.fetchPostsTimer);
  },

  fetchPosts(){
    var component = this;
    fetch("/api/posts.json", {credentials: 'include'})
      .then(function(response){
        return response.json();
      })
      .then(function(json){
        component.setState({
          posts: json.posts
        })
      })
  },

  render: function() {
    return <div>
      <h3>Posts</h3>

      {this.state.posts.map(function(post){
        return <blockquote key={post.id}>{post.text} <cite>{post.user.email}</cite></blockquote>
      })}
    </div>;
  }
});
