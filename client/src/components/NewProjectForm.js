import React from 'react';

const NewProjectForm = ({ createProject }) => {

  const handleSubmit = (event) => {
    event.preventDefault();
    const fd = new FormData(event.currentTarget);
    const params = {
      title: fd.get('title'),
      description: fd.get('description')

    }
    createProject(params);
  }

  return(
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor='title'>Title</label>
        <br />
        <input name='title' id='title' />
      </div>
      <div>
        <label htmlFor='description'>Description</label>
        <br />
        <textarea name='description' id='description' />
      </div>
      <div>
        <input type='submit' value='Submit' />
      </div>
    </form>
  )
}

export default NewProjectForm