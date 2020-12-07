# Boulder Bike Tour - API

This is a Rails API for slogan submission for the prestigious bike racing competition (Boulder Bike Tour) and also project 7 of Openclassrooms full-stack developer path.

* Frontend app: [https://github.com/its-nedum/bike-race-frontend](https://github.com/its-nedum/bike-race-frontend)

## Demo Link
Access the site at [Boulder Bike Tour](https://boulderbike-tour.herokuapp.com)

## Features
- Submit a slogan
- View slogans

## Installation

Clone repo to your local machine:

```git
git clone https://github.com/its-nedum/bike-race-backend.git
```
move into project folder
```
cd bike-race-backend
```

### Install dependencies and run locally

install GemFile
```
    bundle install
```

Create Slogan table
```
    rails db:migrate
```

Now start the rails server:

```
    rails s
```

## API Routes
<table>
	<tr>
		<th>HTTP VERB</th>
		<th>ENDPOINT</th>
		<th>FUNCTIONALITY</th>
	</tr>
    <tr>
        <td>POST</td>
        <td>/api/v1/slogans</td>
        <td>Submit a slogan</td>
    </tr>
    <tr>
        <td>GET</td>
        <td>/api/v1/slogans</td>
        <td>Return all submitted slogans</td>
    </tr>
    <tr>
        <td>GET</td>
        <td>/api/v1/slogans/:id</td>
        <td>Return a single slogan</td>
    </tr>
    <tr>
        <td>DELETE</td>
        <td>/api/v1/slogans/:id</td>
        <td>Delete a slogan</td>
    </tr>
    <tr>
        <td>PATCH / PUT</td>
        <td>/api/v1/slogans/:id</td>
        <td>Update a slogan</td>
    </tr>
</table>