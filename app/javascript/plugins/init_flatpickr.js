import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(datepicker, {});
  }
  const accidentDateField = document.getElementById('accident_date')
  if (accidentDateField) {
    const currentDate = new Date()
    flatpickr(accidentDateField, {
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
      defaultDate: currentDate,
      disableMobile: true
    })
  }
  // const accidentTimeField = document.getElementById('accident_time')
  // if (accidentTimeField) {
  //   const currentDate = new Date()
  //   const currentTime = `${currentDate.getHours()}:${currentDate.getMinutes()}`
  //   flatpickr(accidentTimeField, {
  //     enableTime: true,
  //     noCalendar: true,
  //     time_24hr: true,
  //     dateFormat: "H:i",
  //     defaultDate: currentTime
  //   })
  // }

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

// const accidentDate = () => {
//   const accidentDateField = document.getElementById('accident_date')
//   if (accidentDateField) {
//     const currentDate = new Date()
//     flatpickr(accidentDateField, {
//       dateFormat: "Y-m-d",
//       altInput: true,
//       altFormat: "F j, Y",
//       defaultDate: currentDate
//     })
//   }
// }

// const accidentTime = () => {
//   const accidentTimeField = document.getElementById('accident_time')
//   if (accidentTimeField) {
//     const currentDate = new Date()
//     const currentTime = `${currentDate.getHours()}:${currentDate.getMinutes()}`
//     flatpickr(accidentTimeField, {
//       enableTime: true,
//       noCalendar: true,
//       time_24hr: true,
//       dateFormat: "H:i",
//       defaultDate: currentTime
//     })
//   }

// }

export { initFlatpickr };
