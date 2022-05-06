import React from 'react';
import {DiscussionDetails} from './DiscussionDetails';

export function DiscussionList ({ reviews, deleteDiscussion }) {

  return (
    <>
      {discussions? discussions.map((d, i) => {
        return <DiscussionDetails
          key={i}
          id={d.id}
          body={d.body}
          reviewer={d.reviewer}
          rating={d.rating}
          created_at={d.created_at}
          deleteDiscussion={deleteDiscussion}
        />
      }) :'Discussions loading...'}
    </>
  )
}

