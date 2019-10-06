import SVGInject from '@iconfu/svg-inject'

document.addEventListener('DOMContentLoaded', () => {
  // SVGInject
  let injectables = document.querySelectorAll('img.injectable')
  if (injectables) {
    SVGInject(injectables)
  }
  window.reinjectSvgs = () => SVGInject(document.querySelectorAll('img.injectable'))

  let dropdowns = document.querySelectorAll('.dropdown')
  dropdowns.forEach((dropdown) => {
    let dropdownLink = dropdown.querySelector('.dropdown-link')
    dropdownLink.addEventListener('click', () => {
      dropdownLink.parentNode
        .querySelector('.dropdown-overlay')
        .classList
        .toggle('hidden')
      dropdownLink.parentNode
        .querySelector('.dropdown-list')
        .classList
        .toggle('hidden')
    })

    let dropdownOverlay = dropdown.querySelector('.dropdown-overlay')
    dropdownOverlay.addEventListener('click', () => {
      dropdownOverlay.parentNode
        .querySelector('.dropdown-overlay')
        .classList
        .toggle('hidden')
      dropdownOverlay.parentNode
        .querySelector('.dropdown-list')
        .classList
        .toggle('hidden')
    })
  })
})
