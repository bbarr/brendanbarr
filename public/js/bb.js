(function() {
  
  var $externals = $('.external'),
      $projects = $('#projects'),
      $project_link = $('#project_link'),
      $bio_link = $('#bio_link'),
      $bio = $('#bio'),
      app,
      demo;
  
  $externals.each(function(i, a) {
    a.setAttribute('target', '_blank');
  });

  app = {
    
    default_page: 'projects',
    hash_prefix: '#/',
    
    name_to_hash: function(name) {
      return app.hash_prefix + name;
    },
    
    hash_to_name: function(hash) {
      return hash.replace(app.hash_prefix, '');
    },
    
    pages: {
      bio: function(initial) {
        $projects.addClass('translucent ' + ((initial) ? 'hidden' : ''));
        $bio.removeClass('translucent hidden');
        $project_link.removeClass('active');
        $bio_link.addClass('active');        
      },
      projects: function(initial) {
        $bio.addClass('translucent ' + ((initial) ? 'hidden' : ''));      
        $projects.removeClass('translucent hidden');
        $bio_link.removeClass('active');
        $project_link.addClass('active');        
      }
    },
    
    update: function(initial) {
      
      var hash = location.hash,
          pages = app.pages,
          name = app.hash_to_name(hash);
    
      initial = typeof initial === 'boolean';    
          
      if (name === app.current_page) return;    
          
      if (name === '' || !pages[name]) name = app.default_page;
      
      app.current_page = name;
      pages[name](initial);
      location.hash = app.name_to_hash(name);
    },
    
    init: function() {
      $(window).bind('hashchange', app.update);
      app.update(true);
      //demo.init();
    }
  };
  
  demo = {
    
    init: function() {
      
      var game = new GL.Game({ el: document.getElementById('demo') });
      
      game.stage('balls', new balls.Ball({
        position: new GL.Vector(10, 10),
        velocity: new GL.Vector(2, 1),
        size: 5
      }));
          
      game.stage('balls', new balls.Ball({
        position: new GL.Vector(120, 10),
        velocity: new GL.Vector(-1, 1),
        size: 5
      }));
          
      game.start();    
    }
  }
  
  app.init();
})();