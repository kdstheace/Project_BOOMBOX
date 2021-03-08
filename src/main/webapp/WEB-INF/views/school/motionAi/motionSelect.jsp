<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BOOM SCHOOL</title>
<link href="/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a6b1415e6e.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<!-- google -->
<meta name="google-signin-scope" content="profile email">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="290856146603-r0r54hvfs9vbaf1c6cjpv5egid2ecl44.apps.googleusercontent.com">

<style>
.grid_title {
	font-size: 30px;
}

.main_container {
	padding-top: 30px;
	padding-left: 30px;
}
</style>


<script type="text/javascript">

		function myFunction(str){
  			location.href=str+"&view_start=1";
			alert("시행중");
			/* $('#show_start').show(); */
			}

/* 		function pa(){
 			location.href="/motion/pose?motion_video_id=${motion1.motion_video_id }&motion_title=${motion1.motion_title }";
		}

		function cnt(){
 			location.href="/motion/count?motion_video_id=${motion1.motion_video_id }&motion_title=${motion1.motion_title }";
		}
 */

	    $(function(){
	    	  $('#pa').click(function(){
	    	    $('#pose_accuracy').css({"display": "block"});
	    	    $('#count').css({"display": "none"});
	    	    
	    	  });
	    	  $('#cnt').click(function(){
	    	    $('#count').css({"display": "block"});
	    	    $('#pose_accuracy').css({"display": "none"});
	    	  });

	    	  if ("${view_start }" == 1) {
	    		  $('#show_start').show();
		   	  }
	    	});

		

    </script>



</head>

<body>
	<jsp:include page="/WEB-INF/views/menu/navi-school.jsp" />
	<!-- Page Content -->
	<!-- main content -->
	<div class="row main_container">
		<div class="col-md-12">

<!-- 		<button class="btn_show" style="padding:3px">show</button>
		<button class="btn_hide" style="padding:3px">hide</button>
		<div class="btn_word">Hello world!!!</div> -->

			<!-- 여기에 쓰면 된다!! -->

			<input class="btn btn-warning" type="button" id="pa" name="pa" value="Pose" style="width: 130px; height: 50px; font-size: 30px;"> 
			<input class="btn btn-warning" type="button" id="cnt" name="cnt" value="Count" style="width: 130px; height: 50px; font-size: 30px;"> 
			<br><br> 
			<div id="pose_accuracy" >
			<select name="pose_accuracy" onchange="myFunction(this.value)" style="width: 265px; height: 30px;">
				<option value="">자세를 선택해 주세요</option>
				<c:forEach items="${list1 }" var="motion1">
					<option value="/motion/pose?motion_video_id=${motion1.motion_video_id }&motion_title=${motion1.motion_title }">${motion1.motion_title }</option>
				</c:forEach>
				
				
				
			</select>
			</div>
			<div id="count" style="display:none;" >
			<select name="count" onchange="myFunction(this.value)" style="width: 265px; height: 30px;">
           		<option value=""> 자세를 선택해 주세요</option>
           		<c:forEach items="${list2 }" var="motion2">
           			<option value="/motion/count?motion_video_id=${motion2.motion_video_id }&motion_title=${motion2.motion_title }">${motion2.motion_title }</option>
           		</c:forEach>
             </select>
             	</div>
			<br>
			<br>
			<c:choose>
					<c:when test="${motion.motion_class == 1}">
						<div id="show_start" style="float: center; display: none;" >
							<a style="font-size: 25px;"><strong> ${motion.motion_title}</strong></a> &emsp;
							<button type="button" style="font-size: 25px;" onclick="initP()">StartP</button>
							
								<script src="/resources/js/tf.min.js"></script>
								<script src="/resources/js/teachablemachine-pose.min.js"></script>
								<script type="text/javascript">
							
									const video_id = "<c:out value='${motion.motion_video_id}'/>"
									const motion_class = "<c:out value='${motion.motion_class}'/>"
									const motion_title = "<c:out value='${motion.motion_title}'/>"
								    
							 	    const URL1 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/metadata.json');
								    const URL2 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/model.json'); 
							
								    let model, webcam, ctx, labelContainer, maxPredictions;
								
								    async function initP() {
								    	const metadataURL = URL1;
								        const modelURL = URL2;
							
								        model = await tmPose.load(modelURL, metadataURL);
								        maxPredictions = model.getTotalClasses();
								
								        // Convenience function to setup a webcam
								        const width = 900;
								        const height = 500;
								        const flip = true; // whether to flip the webcam
								        webcam = new tmPose.Webcam(width, height, flip); // width, height, flip
								        await webcam.setup(); // request access to the webcam
								        await webcam.play();
								        window.requestAnimationFrame(loop);
								
								        // append/get elements to the DOM
								        const canvas = document.getElementById("canvas");
								        canvas.width = width; canvas.height = height;
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
									    console.log("포즈");
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
					</c:when>
					<c:otherwise>
						<div id="show_start" style="float: center; display: none;" >
							<a style="font-size: 25px;"><strong> ${motion.motion_title}</strong></a> &emsp;
							<button type="button" style="font-size: 25px;" onclick="initC()">StartC</button>
								<script type="text/javascript">
							
									const video_id = "<c:out value='${motion.motion_video_id}'/>"
									const motion_class = "<c:out value='${motion.motion_class}'/>"
									const motion_title = "<c:out value='${motion.motion_title}'/>"
								    
							 	    const URL1 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/metadata.json');
								    const URL2 = '../../resources/motionAi/'.concat(video_id, '/',motion_class,'/',motion_title,'/model.json'); 
							
								    let model, webcam, ctx, labelContainer, maxPredictions;
								
								    async function initC() {
								    	const metadataURL = URL1;
								        const modelURL = URL2;
								        
								        model = await tmPose.load(modelURL, metadataURL);
								        maxPredictions = model.getTotalClasses();
								
								        // Convenience function to setup a webcam
								        const width = 900;
								        const height = 500;
								        const flip = true; // whether to flip the webcam
								        webcam = new tmPose.Webcam(width, height, flip); // width, height, flip
								        await webcam.setup(); // request access to the webcam
								        await webcam.play();
								        window.requestAnimationFrame(loop);
								
								        // append/get elements to the DOM
								        const canvas = document.getElementById("canvas");
								        canvas.width = width; canvas.height = height;
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
								    	console.log("카운트");
								        // Prediction #1: run input through posenet
								        // estimatePose can take in an image, video or canvas html element
								        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
								        // Prediction 2: run input through teachable machine classification model
								        const prediction = await model.predict(posenetOutput);
								        //내가 친 곳 
										if(prediction[0].probability.toFixed(2) == 1.00){
											if(status == "squat"){
												count ++;
												var audio = new Audio("/resources/count/" + (count%10) + ".mp3" );
												audio.play();
											}
											status = "stand";
										} else if(prediction[1].probability.toFixed(2) == 1.00){
											status = "squat";
										} else if(prediction[2].probability.toFixed(2) == 1.00){
											if(status == "squat" || status == "stand"){
												var audio = new Audio("/resources/count/wrong.mp3");
												audio.play();
											}
											status = "bent";
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
					</c:otherwise>
			</c:choose>

			

			<br>
			<br>
			<br>

			<h3>동작 샘플 사진</h3>
			<img src="/resources/img/BOOMBOXsq.png" alt="사진"
				style="width: 250px; height: 250px"> <br>
			<br>

			<h3>동작 설명</h3>
			<textarea rows="6" cols="30" readonly="readonly"
				style="resize: none; border: none; font-size: 18px;">이번 동작은 고양이 자세입니다.</textarea>
			<br>



		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
</body>
</html>