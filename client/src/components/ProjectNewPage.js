import React, { Component } from 'react'
import NewProjectForm from './NewProjectForm';
import { Project } from '../requests';

class ProductNewPage extends Component {
  constructor(props) {
    super(props);
    this.createProject = this.createProject.bind(this)
  }

  createProject(params) {
    Project.create(params)
      .then(({ id }) => {
        this.props.history.push(`/projects/${id}`)
      })
  }

  render() {
    return(
      <main>
        <NewProjectForm createProject={this.createProject} />
      </main>
    )
  }
}

export default ProjectNewPage