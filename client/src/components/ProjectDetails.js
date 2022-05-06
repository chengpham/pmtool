import React from 'react';

export function ProjectDetails(props) {
  const {title, description, created_at} = props
  return (
    <div>
      <h2>{title}</h2>
      <p>{description}</p>
    </div>
  ) 
}
