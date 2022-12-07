require 'swagger_helper'

RSpec.describe '/users', type: :request do
  path '/users' do

    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'all users' do
        schema type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string }
          },
          required: [ 'name', 'email' ]

        let(:id) { User.create(name: 'Mary Sue', email: 'msue@email.com').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users/{id}' do

    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            email: { type: :string },
            create_at: { type: :string },
            update_at: { type: :string },
            url: { type: :string }
          },
          required: [ 'id', 'name', 'email' ]

        let(:id) { User.create(name: 'Mary Sue', email: 'msue@email.com').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string }
        },
        required: [ 'name', 'email' ]
      }

      response '201', 'User was successfully created.' do
        let(:user) { { name: 'John Doe', email: 'johndoe@email.com '} }
        run_test!
      end

      response '422', 'Invalid fields' do
        let(:user) { { name: 'John' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do

    put 'Updates a user matching the id' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          email: { type: :string }
        },
        required: [ 'id', 'name', 'email' ]
      }

      response '201', 'User was successfully updated.' do
        let(:user) { { id: 1, name: 'Doe', email: 'johndoe@email.com '} }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:user) { { name: 'John' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do

    delete 'Deletes a user matching the id' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          email: { type: :string }
        },
        required: [ 'id', 'name', 'email' ]
      }

      response '204', 'User was deleted.' do
        let(:user) { { id: 1, name: 'John Doe', email: 'johndoe@email.com '} }
        run_test!
      end

      response '422', 'Unprocessable entity' do
        let(:user) { { name: 'John' } }
        run_test!
      end
    end
  end

end
