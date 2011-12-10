var balls = {};

balls.Game = GL.Game.extend(function() {
  
}, {
  
});

balls.Ball = GL.Piece.extend(function(config) {
  this.position = config.position;
  this.velocity = config.velocity;
  this.last_velocity = this.velocity.clone();
  this.size = config.size;
  this.diameter = this.size * 2;
  this.elasticity = .8;

  this.influences.push(GL.COLLISIONS);
  this.influences.push({
  
    affect: function() {
      var position = this.position,
          size = this.size,
          right = position.x + size > 130,
          left = position.x - size < 0,
          bottom = position.y + size > 100,
          top = position.y - size < 0;
      
      if (right || left) {
        right ? (this.position.x = 130 - size) : (this.position.x = size);
        this.velocity.x *= -1;
      }  
      else if (top || bottom) {
        bottom ? (this.position.y = 100 - size) : (this.position.y = size);        
        this.velocity.y *= -1;        
      }
    }
  });

}, {
  
  tick: function() {
    this.erase();
    this.stage.game.influence(this); 
    this.position.add(this.velocity);
    this.draw();
  },
  
  erase: function() {
    var radius = this.size + 2,
        diameter = radius * 2;
    this.stage.ctx.clearRect(this.position.x - radius, this.position.y - radius, diameter, diameter);
  },
  
  draw: function() {
    var ctx = this.stage.ctx,
        position = this.position;
    ctx.beginPath();
    ctx.arc(position.x, position.y, this.size, 0, Math.PI * 2);
    ctx.stroke();
  }
});

balls.Turret = GL.Piece.extend(function(config) {
  
}, {
  
});