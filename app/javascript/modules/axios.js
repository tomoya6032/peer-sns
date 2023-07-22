import axios from 'axios'
import 'trix/dist/trix.css'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default axios