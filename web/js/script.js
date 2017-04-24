$(function(){
  console.log('My peer');
  var messages = [];
  var peer_id, name, conn, call;
  var messages_template = Handlebars.compile($('#messages-template').html());

  var peer = new Peer({
   	key: 'lwjd5qra8257b9',
  });

  peer.on('open', function(){ 
    console.log('My peer ID is: ' + peer.id);
    $('#id').text(peer.id);
  });

  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

  function getVideo(callback){
    navigator.getUserMedia({audio: true, video: true}, callback, function(error){
      console.log(error);
      alert('An error occured. Please try again');
    });
  }

  getVideo(function(stream){
    window.localStream = stream;
    onReceiveStream(stream, 'my-camera');
  });

  function onReceiveStream(stream, element_id){
    var video = $('#' + element_id + ' video')[0];
    video.src = window.URL.createObjectURL(stream);
    window.peer_stream = stream;
  }

  $('#login').click(function(){
    name = $('#name').val();
    peer_id = $('#peer_id').val();
    if(peer_id){
      conn = peer.connect(peer_id, {metadata: {
        'username': name
      }});
      console.log(peer);
      conn.on('data', handleMessage);
      conn.on('close', function() { 
         console.log('disconnected from ' + peer_id);
         $('#peer-camera').attr('hidden','true');
         $('#chat').addClass('hidden');
         $('#connected_peer_container').addClass('hidden');
         $('#connect').removeClass('hidden');
         $('#peer_id').removeClass('hidden');
      });

    }

    $('#peer-camera').removeAttr('hidden');
    $('#chat').removeClass('hidden');
    $('#connect').addClass('hidden');
  });

  peer.on('connection', function(connection){
    conn = connection;
    peer_id = connection.peer;
    conn.on('data', handleMessage);
    $('#peer_id').addClass('hidden').val(peer_id);
    $('#connected_peer_container').removeClass('hidden');
    $('#connected_peer').text(connection.metadata.username);
    
    conn.on('close', function() { 
        console.log(peer_id + " disconnected"); 
        console.log(peer);
        $('#peer-camera').attr('hidden','true');
        $('#chat').addClass('hidden');
        $('#connected_peer_container').addClass('hidden');
        $('#connect').removeClass('hidden');
        $('#peer_id').removeClass('hidden');
    });
    
    conn.on('error', function(error) { 
        console.log("remote error: " + error.type, { status: 'err', prefix: '*' }); 
    });
  });

  function handleMessage(data){
    var header_plus_footer_height = 285;
    var base_height = $(document).height() - header_plus_footer_height;
    var messages_container_height = $('#messages-container').height();
    messages.push(data);

    var html = messages_template({'messages' : messages});
    $('#messages').html(html);

    if(messages_container_height >= base_height){
      $('html, body').animate({ scrollTop: $(document).height() }, 500);
    }
  }

  function sendMessage(){
    var text = $('#message').val();
    var data = {'from': name, 'text': text};

    conn.send(data);
    handleMessage(data);
    $('#message').val('');
  }

  $('#message').keypress(function(e){
    if(e.which == 13){
      sendMessage();
    }
  });

  $('#send-message').click(sendMessage);

  $('#call').click(function(){
    console.log('now calling: ' + peer_id);
    console.log(peer);
    call = peer.call(peer_id, window.localStream);
    call.on('stream', function(stream){
      window.peer_stream = stream;
      onReceiveStream(stream, 'peer-camera');
    });
  });
  
   $('#hang').click(function(){
    console.log('Disconnecting call');
    console.log(peer);
    conn.close();
    console.log(peer);
  });

  peer.on('call', function(call){
    onReceiveCall(call);
  });

  peer.on('close', function() {
//    conn.close();
    $('#peer-camera').attr('hidden','true');
    $('#chat').addClass('hidden');
    $('#connected_peer_container').addClass('hidden');
    $('#connect').removeClass('hidden');
    $('#peer_id').removeClass('hidden');     
  });

  function onReceiveCall(call){
    call.answer(window.localStream);
    call.on('stream', function(stream){
      window.peer_stream = stream;
      onReceiveStream(stream, 'peer-camera');
      $('#call').addClass('disabled');
    });
  }

});
