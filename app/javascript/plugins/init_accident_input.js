import $ from 'jquery'

const accidentInput = () => {
  const accidentText = document.getElementById('accident_description')
  if (accidentText) {
    accidentText.insertAdjacentHTML("beforebegin", '<button type="button" class="btn btn-primary py-0 my-1 mx-3" data-toggle="modal" data-target="#accidentModal">Quick input</button>');
    // insertInput()
    $('#accidentModal').on('hide.bs.modal', function (e) {
      const $button = $(document.activeElement)
      if (document.activeElement.id == 'accidentModal' || $button[0].innerText == '×') {
        let text = ''
      } else {
        let text = $button[0].innerText;
        $("#accident_description").val(text).focus();
        $('#accidentModal').on('hidden.bs.modal', function (e) {
          document.querySelector("#accident_description").focus();
          // document.querySelector("#accident_description").select();
        })
      }




    })


  }

}

// const insertInput = () => {

//   const fell = document.getElementById('fell')
//   const hit = document.getElementById('hit')
//   const crushed = document.getElementById('crushed')
//   const burned = document.getElementById('burned')
//   const electrocuted = document.getElementById('electrocuted')

//   fell.addEventListener('click', inputFinder )
//   hit.addEventListener('click', inputFinder)
//   crushed.addEventListener('click', inputFinder)
//   burned.addEventListener('click', inputFinder)
//   electrocuted.addEventListener('click', inputFinder)
// }

// const inputFinder = (event) => {
  // }



export { accidentInput }
