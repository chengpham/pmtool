import React, { Component } from 'react'
import {ProjectDetails} from './ProjectDetails';
import {DiscussionList} from './DiscussionList';
import { Project } from '../requests';

class ProjectShowPage extends Component {
  constructor(props) {
    super(props)
    this.state = { project: {} }
  }
  componentDidMount() {
    Project.show(this.props.match.params.id)
      .then(project => {
        this.setState((state) => {
          return {
            project: project
          }
        })
      })
  }
  deleteDiscussion(id) {
    this.setState((state) => {
      return {
        discussions: state.discussions.filter(r => r.id !== id)
      }
    })
  }

  render() {
    
    return(
    <main>
      {Object.keys(this.state.project).length === 0 ? 'Project loading...' :
      <>
      <ProjectDetails
        title={this.state.project.title}
        description={this.state.project.description}
        created_at={this.state.project.created_at}
      />
      <DiscussionList
        discussions={this.state.project.discussion}
        deleteDiscussion={this.deleteDiscussion.bind(this)}
      />
      </>
    }
    </main>
    )
  }
}

export default ProjectShowPage

