
<form action="/tasks/<%=@task.id%>" method="post">
<input type="hidden" name="_method" value="put"/>
  <div class="form-group">
    <h2 class="text-left" class="bg-primary"><strong>Enter a NEW task: </strong></h2>
    <label for="inputTitle">Task Title</label>
    <input type="text" class="form-control" id="inputTitle" name="task[title]"/>
  </div>

  <div class="form-group">
    <label for="inputDescription">Description</label>
    <textarea class="form-control" rows="3" name="task[description]"></textarea>
  </div>

  <button type="submit" class="btn btn-success">Resubmit</button>
</form>
