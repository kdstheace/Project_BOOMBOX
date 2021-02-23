<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>MotionAI-Pose</title>
	<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a6b1415e6e.js" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
    <style>

        .main_container {
            padding-top: 30px;
            padding-left: 30px;
        }
        .container{
        	width: 2000;
        	margin: 100px auto 0;
        	padding: 0;
        }
        .box{
        	float: left;
        	height: 800;
        	margin: 0 30px;
        	padding: 0;
        	position: relative;
        }
        .canvas{
        	position: absolute;
        	top: 0;
        	left: 0;
        }
        .result{
        	position: absolute;
        	top: 200px;
        	left: 150px;
        }
        

    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/school/motionAi/motionSelect.jsp" />
    <!-- Page Content -->


         <!-- main content -->
         <div class="row main_container">
            <div class="col-md-12">   
            	<div>
            		${motion.motion_title}
            	</div>
	
	<button type="button" onclick="init()">Start</button>
		<div id="label-container"></div><br>
	<div class="container">
		<div class="box">
			<canvas class="canvas" id="canvas"></canvas>
			<img class="result" id="result" src=" ">

		</div>
	</div>


	
	<script src="/resources/js/tf.min.js"></script>
	<script src="/resources/js/teachablemachine-pose.min.js"></script>
	<script type="text/javascript">

		const video_id = "<c:out value='${motion.motion_video_id}'/>"
		const motion_class = "<c:out value='${motion.motion_class}'/>"
		const motion_title = "<c:out value='${motion.motion_title}'/>"
	    
 	    const URL1 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/metadata.json');
	    const URL2 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/model.json'); 

	    let model, webcam, ctx, labelContainer, maxPredictions;
	
	    async function init() {
	    	const metadataURL = URL1;
	        const modelURL = URL2;

	        model = await tmPose.load(modelURL, metadataURL);
	        maxPredictions = model.getTotalClasses();
	
	        // Convenience function to setup a webcam
	        const size = 800;
	        const flip = true; // whether to flip the webcam
	        webcam = new tmPose.Webcam(size, size, flip); // width, height, flip
	        await webcam.setup(); // request access to the webcam
	        await webcam.play();
	        window.requestAnimationFrame(loop);
	
	        // append/get elements to the DOM
	        const canvas = document.getElementById("canvas");
	        canvas.width = size; canvas.height = size;
	        ctx = canvas.getContext("2d");
	        labelContainer = document.getElementById("label-container");
	        for (let i = 0; i < maxPredictions; i++) { // and class labels
	            labelContainer.appendChild(document.createElement("div"));
	        }
	    }
	
	    async function loop(timestamp) {
	        webcam.update(); // update the webcam frame
	        await predict();
	        window.requestAnimationFrame(loop);
	    }
	
		var status = "stand";
		var count = 0;
	    
	    async function predict() {
	        // Prediction #1: run input through posenet
	        // estimatePose can take in an image, video or canvas html element
	        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	        // Prediction 2: run input through teachable machine classification model
	        const prediction = await model.predict(posenetOutput);
	        //내가 친 곳 
	        var okay = '/resources/img/pose/okay.png';
	        var wrong = '/resources/img/pose/nope.png';
			if(prediction[0].probability.toFixed(2) == 1.00){
				document.getElementById('result').src = okay;
			} else if(prediction[1].probability.toFixed(2) == 1.00){
				document.getElementById('result').src = okay;
			} else if(prediction[2].probability.toFixed(2) == 1.00){
				document.getElementById('result').src = wrong;
			}else{
				document.getElementById('result').src = '';
			}
	
	
	        for (let i = 0; i < maxPredictions; i++) {
	            const classPrediction =
	                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
	            labelContainer.childNodes[i].innerHTML = classPrediction;
	        }
	
	        
	        drawPose(pose);
	    }
	
	    function drawPose(pose) {
	        if (webcam.canvas) {
	            ctx.drawImage(webcam.canvas, 0, 0);
	            // draw the keypoints and skeleton
	            if (pose) {
	                const minPartConfidence = 0.5;
	                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
	                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
	            }
	        }
	    }
	</script>
            
            
            </div>
         </div>

          
	

	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
      integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
      crossorigin="anonymous"></script>
</body>
</html>