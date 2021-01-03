User has many Clients
Client belongs to User(Coach)

# Create
## New (displays the form to make the new thing)
   - get /clients/new
   - new.erb

## Create (processes the form and actually makes and save the thing)
   - post /clients
   - no view, redirects to show or index for that thing
   - Model.create


# Read
## Index (all things)
   - get /clients
   - index.erb
   - Model.all

## Show (detailed things)
   - get /clients/:id
   - show.erb
    Model.find_by(id: params[:id])


# Update
## Edit (like new, display the form to change one thing)
   - get /clients/:id/edit
   - edit.erb
   - Model.find_by(id: params[:id])

## Update (like create, processes the form and makes the change)
   - patch /clients/:id
   - no view, redirect to show
   - instance = Model.find_by(id: params[:id])
   - instance.update(params[:key])


# Delete
## Destroy (process the form and destroys the thing)
   - delete /clients/:id
   - no view, redirect to index 
   - instance = Model.find_by(id: params[:id])
   - instance.destroy
