<h1>Editing a Task</h1>

<form action="/tasks/<%= @task.id %>" method="post">
  <p>Edit</p>
  <input type="hidden" name="_method" value="PUT" />
  <input type='text' name='task[title]' value="<%= @task.title %>"/><br/>
  <textarea name='task[description]'><%= @task.description %></textarea><br/>
  <input type='submit'/>
</form>
