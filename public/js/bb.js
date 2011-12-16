(function() {
  
  var $externals = $('.external'),
      $projects = $('#projects'),
      $contact = $('#contact'),
      $window = $('html,body'),
      $project_link = $('#project_link'),
      $bio_link = $('#bio_link'),
      $contact_link = $('#contact_link'),
      $internals = $project_link.add($contact_link).add($bio_link),
      $bio = $('#bio'),
      app, demo;

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
        $window.animate({ scrollTop: $bio.offset().top - 112 }, 1000);
        $internals.removeClass('active');
        $bio_link.addClass('active');
      },
      projects: function(initial) {
        $window.animate({ scrollTop: 0 }, 1000);        
        $internals.removeClass('active');
        $project_link.addClass('active');
      },
      contact: function(initial) {
        $window.animate({ scrollTop: $contact.offset().top - 112 }, 1000);
        $internals.removeClass('active');
        $contact_link.addClass('active');        
      }
    },
    
    update: function(initial) {
      
      var hash = location.hash,
          pages = app.pages,
          name = app.hash_to_name(hash);
    
      initial = typeof initial === 'boolean';    
          
      if (name === '' || !pages[name]) name = app.default_page;
      
      app.current_page = name;
      pages[name](initial);
      location.hash = app.name_to_hash(name);
    },
    
    init: function() {
      $(window).bind('hashchange', app.update);
      $externals.each(function(i, a) {
        a.setAttribute('target', '_blank');
      });
      $internals.click(function(e) {
        var $this = $(this);
        if ($this.attr('href') === location.hash) {
          app.update();
        }
      });
      app.update(true);
      //demo.init();
    }
  };
  
  demo = {
    
    init: function() {
      var game = new balls.Game({ el: document.getElementById('demo') });
      game.stage('balls', new balls.Ball({
        size: 5,
        position: new GL.Vector(0, 0),
        velocity: new GL.Vector(1, 1)
      }));
      game.stage('balls', new balls.Ball({
        size: 5,
        position: new GL.Vector(0, 100),
        velocity: new GL.Vector(-1, 1)
      }));
      game.stage('balls', new balls.Ball({
        size: 5,
        position: new GL.Vector(80, 100),
        velocity: new GL.Vector(-1, -2)
      }));
      
      game.stages.balls.canvas.addEventListener('click', function(e) {
        var g = new balls.G(e.layerX, e.layerY);
        game.stage('balls', g);
      });
      
      game.start();
      
    }
  }
  
  app.init();
})();