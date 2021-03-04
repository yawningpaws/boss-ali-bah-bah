import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(datepicker, {});
  }

  const workdayForm = document.querySelector('#workday-form-dates')
  const workdayDate = document.querySelector('#workday_date');
  if (workdayDate) {
    const clickedDate = window.location.search.substring(1)
    if (clickedDate) {
      flatpickr(workdayDate, {
        dateFormat: "Y-m-d",
        altInput: true,
        altFormat: "F j, Y",
        defaultDate: clickedDate,
        enable: [clickedDate]
      });
    } else {
      currentDate = new Date();
      flatpickr(workdayDate, {
        dateFormat: "Y-m-d",
        altInput: true,
        altFormat: "F j, Y",
        defaultDate: currentDate,
        disable: JSON.parse(workdayForm.dataset.completedDates)
      });
    }


  }
}

export { initFlatpickr };
