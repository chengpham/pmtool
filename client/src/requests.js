const BASE_URL = 'http://localhost:3000/api/v1';

export const Session = {
  create(params) {
    return fetch(`${BASE_URL}/session`, {
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include', 
      method: 'POST',
      body: JSON.stringify(params)
    }).then((res) => {
      return res.json();
    })
  }
}

export const Project = {
  index() {
    return fetch(`${BASE_URL}/projects`)
      .then(res => {
        console.log(res)
        return res.json();
      })
  },
  create(params) {
    return fetch(`${BASE_URL}/projects`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(params)
    }).then(res => res.json())
  },
  show(id) {
    return fetch(`${BASE_URL}/projects/${id}`)
      .then(res => res.json())
  }
}