$.attachinary.config.disableWith = 'Загрузка...'
$.attachinary.config.invalidFormatMessage = 'Invalid file format'
$.attachinary.config.template = """
  <div class="fileupload">
    <% for(var i=0; i<files.length; i++){ %>
        <% if(files[i].resource_type == "raw") { %>
          <div class="raw-file"></div>
        <% } else { %>
          <div class="inline">
          <img src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "crop": 'thumb', "width": 50, "height": 50, "dpr" : 3.0 }) %>" alt="" width="50" height="50" />
          </div>
        <% }   %>
        <btn class="btn btn-w btn-small inline" href="#" data-remove="<%= files[i].public_id %>">X</btn>
    <% } %>
  </div>
"""