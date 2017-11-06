document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  canvas.height = 1000; 
  canvas.width = 1000;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "purple"; 
  ctx.fillRect(100, 50, 550, 500); //draws at first 2 positions with a width and height of last 2

  // ctx.beginPath(); 
  // ctx.arc(20, 40, 50, 0, 2*Math.PI, true);
  // ctx.strokeStyle = "purple"; 
  // ctx.lineWidth = 10; 
  // ctx.stroke();
  // ctx.fillStyle = "blue";
  // ctx.fill();

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2*Math.PI, true); 
  // ctx.moveTo(400, 75);
  ctx.arc(250, 75, 50, 20, 1*Math.PI , true);
  ctx.fillStyle = "blue"; 
  ctx.arc (500, 500, 200, 0, .5*Math.PI, true);
  ctx.fill();
  // ctx.stroke();


});
