import './App.css';
import { Component } from 'react';
import ProjectShowPage from './components/ProjectShowPage';
import ProjectIndexPage from './components/ProjectIndexPage';
import ProjectNewPage from './components/ProjectNewPage';
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import { Session } from './requests';
import Navbar from './components/Navbar';

class App extends Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    Session.create({
      email: 'js@winterfell.gov',
      password: 'supersecret'
    }).then(console.log)
  }

  render() {
    return (
      <div className="App">
        <BrowserRouter>
        <Navbar />
          <Switch>
            <Route path='/' exact render={() => <div>Home</div> } />
            <Route path='/projects/new' component={ProjectNewPage} />
            <Route path='/projects/:id' component={ProjectShowPage} />
            <Route path='/projects' component={ProjectIndexPage} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
