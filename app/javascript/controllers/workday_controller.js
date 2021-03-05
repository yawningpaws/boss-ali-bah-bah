import { Controller } from "stimulus"
import { initFlatpickr } from '../plugins/init_flatpickr';

export default class extends Controller {
  connect() {
    initFlatpickr();
  }
}
