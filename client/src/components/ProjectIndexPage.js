import React, { Component } from 'react';
import { Project } from '../requests';
import { Link } from 'react-router-dom';

class ProdjectIndexPage extends Component {
    constructor(props) {
        super(props);
        this.state = { projects: [] }
    }
    componentDidMount() {
        Project.index()
          .then((projects) => {
            this.setState((state) => {
              return {
                projects: projects
              }
            })
          })
      }
    createProject(params) {
        this.setState({
            projects: [{id: (Math.max(...this.state.projects.map(p => p.id)) + 1), ...params},...this.state.projects]
        })
    }
    deleteProject(id) { this.setState({ projects: this.state.projects.filter(p => p.id !== id) }) }
    render() {
        return(
            <main>
            {this.state.projects.length>0 ? this.state.projects.map(p => {
                return(
                <div key={p.id}>
                    <Link to={`/projects/${p.id}`}>
                    <h1>{p.id} - {p.title}</h1>
                    </Link>
                    <button onClick={() => this.deleteProject(p.id)}>Delete</button>
                </div>
                )
            }) : "Projects are loading..."}
            </main>
        )
    }
}

export default ProjectIndexPage