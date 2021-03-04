import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(datepicker, {});
  }

  const workdayForm = document.querySelector('#workday-form-dates')
  const workdayDate = document.querySelector('#workday_date');
  if (workdayDate) {
    const currentDate = new Date();
    flatpickr(workdayDate, {
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
      defaultDate: currentDate,
      disable: JSON.parse(workdayForm.dataset.completedDates)
    });
  }
}

export { initFlatpickr };
