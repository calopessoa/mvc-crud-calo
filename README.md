# MVC-CRUD
[![CI/CD with Github Actions](https://github.com/calopessoa/mvc-crud-calo/actions/workflows/pipeline.yml/badge.svg)](https://github.com/calopessoa/mvc-crud-calo/actions/workflows/pipeline.yml)

This is a project using the basics of scaffold CRUD building with Ruby on Rails. The goal here is to use the API REST to test them with RSpec.
You may find unitary and integration tests inside the spec folder.

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      3.0.3
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      7.0.4
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite
    </td>
  </tr>
</table>

## Tools Used

- Ruby
- On Rails
- RSpec
- SQLite
- CI/CD Github Actions / Jenkins
- libs:
  - FactoryBot
  - Database Cleaner
  - Pry
  - Awesome Print

## Setup

Clone this repository into your local machine, and move to the project's folder
```bash
https://github.com/calopessoa/mvc-crud-calo.git
```

```bash
cd mvc-crud-calo
```
Install dependencies
```bash
bundle install
```

## Usage

Load up the server
```bash
rails s
```
It'll be available at:
http://localhost:3000/users
or
http://localhost:3000/usuarios

## Tests

Run the following command:
```bash
rspec
```
