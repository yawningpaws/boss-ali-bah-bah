import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(datepicker, {});
  }

  const workday_date = document.querySelector('#workday_date');
  if (workday_date) {
    const currentDate = new Date();
    flatpickr(workday_date, {
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
      defaultDate: currentDate
      // disable dates which already have records
    });
  }

  const workday_check_in_time = document.querySelector('#workday_check_in_time');
  if (workday_check_in_time) {
    const currentDate = new Date();
    const currentTime = `${currentDate.getHours()}:${currentDate.getMinutes()}`
    flatpickr(workday_check_in_time, {
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      dateFormat: "H:i",
      defaultDate: currentTime
    });
  }

  const workday_check_out_time = document.querySelector('#workday_check_out_time');
  if (workday_check_out_time) {
    flatpickr(workday_check_out_time, {
      enableTime: true,
      noCalendar: true,
      time_24hr: true,
      dateFormat: "H:i",
      defaultDate: "20:00"
    });
  }
}

export { initFlatpickr };
