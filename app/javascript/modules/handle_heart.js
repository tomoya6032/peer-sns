import $ from 'jquery'
import axios from 'modules/axios'


const listenInactiveHeratEvent = (tweetId) => {

  $('.inactive-heart').on('click', () => {
     axios.post(`/tweets/${tweetId}/like`)
     .then((response) => {
       if (response.data.status === 'ok') {
         $('.active-heart').removeClass('hidden')
         $('.inactive-heart').addClass('hidden')
       }
     })
     .catch((e) => {
       window.alert('Error')
       console.log(e)
      })
   })
}

const listenActiveHeratEvent = (tweetId) => {
    
  $('.active-heart').on('click', () => {
      axios.delete(`/tweets/${tweetId}/like`)
      .then((response) => {
          if (response.data.status === 'ok') {
              $('.active-heart').addClass('hidden')
              $('.inactive-heart').removeClass('hidden')
          }
       })
       .catch((e) => {
          window.alert('Error')
          console.log(e)
       })
    })   
}

export {
  listenInactiveHeratEvent,
  listenActiveHeratEvent
}