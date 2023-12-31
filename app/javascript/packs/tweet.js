import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeratEvent,
  listenActiveHeratEvent
} from 'modules/handle_heart'

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const appendNewComment = (comment) => {
  $('.comments-container').append(`
    <div class="article_comment">
      <p>${comment.content}</p>
    </div>
  `)
}

document.addEventListener('DOMContentLoaded', () => {
    const likeButtons = document.querySelectorAll('.like-button');
  
    likeButtons.forEach(button => {
      button.addEventListener('click', () => {
        location.reload(); // ページをリロードする
      });
    });
  });
  
  
  
  

// document.addEventListener('DOMContentLoaded', () => {
//     const likeButtons = document.querySelectorAll('.like-button');
  
//     likeButtons.forEach(button => {
//       button.addEventListener('click', event => {
//         event.preventDefault(); // リンクのデフォルトの動作を無効にする
  
//         const url = event.target.getAttribute('href');
//         const method = event.target.getAttribute('data-method');
        
//         axios({
//           method: method,
//           url: url,
//           responseType: 'json'
//         })
//         .then(response => {
//           // ここで必要なUIの変更を行う
//         })
//         .catch(error => {
//           console.error(error);
//         });
//       });
//     });
//   });
  

document.addEventListener('DOMContentLoaded', () => {
    const dataset = document.getElementById('tweet-show').dataset;
    const tweetId = dataset.tweetId;
  
    // axios.get(`/articles/${articleId}/comments`)
    //   .then((response) => {
    //     const comments = response.data;
    //     comments.forEach((comment) => {
    //       appendNewComment(comment);
    //     });
    //   });
  
  //   handleCommentForm();
  
  //   $('.add-comment-button').on('click', () => {
  //     const content = $('#comment_content').val();
  //     if (!content) {
  //       window.alert('コメントを入力してください');
  //     } else {
  //       axios.post(`/articles/${articleId}/comments`, {
  //           comment: { content: content }
  //         })
  //         .then((res) => {
  //           const comment = res.data;
  //           appendNewComment(comment);
  //           $('#comment_content').val('');
  //         })
  //         .catch((error) => {
  //           console.log(error);
  //         });
  //     }
  //   });
  
    // 「いいね！」ボタンの状態を表示
    axios.get(`/tweets/${tweetId}/like`)
      .then((response) => {
        const hasLiked = response.data.hasLiked;
        handleHeartDisplay(hasLiked);
      });
  
    listenInactiveHeratEvent(tweetId);
    listenActiveHeratEvent(tweetId);
  });
  