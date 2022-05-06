

export function DiscussionDetails({ id, body, reviewer, rating, deleteDiscussion }) {
    return (
      <div>
        <p>{body}</p>
        <p><button onClick={() => deleteDiscussion(id)}>Delete</button></p>
      </div>
    )
  }
  
