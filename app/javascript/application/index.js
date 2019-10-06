import SVGInject from '@iconfu/svg-inject'

document.addEventListener('DOMContentLoaded', () => {
  // SVGInject
  let injectables = document.querySelectorAll('img.injectable')
  if (injectables) {
    SVGInject(injectables)
  }
  window.reinjectSvgs = () => SVGInject(document.querySelectorAll('img.injectable'))

  let dropdown = document.querySelector('.dropdown-link');
  let dropdownOverlay = document.querySelector('.dropdown-overlay');

  dropdown.addEventListener('click', () => {
    dropdown.parentNode.querySelector('.dropdown-overlay').classList.toggle('hidden')
    dropdown.parentNode.querySelector('.dropdown-list').classList.toggle('hidden')
  })

  dropdownOverlay.addEventListener('click', () => {
    dropdown.parentNode.querySelector('.dropdown-overlay').classList.toggle('hidden')
    dropdown.parentNode.querySelector('.dropdown-list').classList.toggle('hidden')
  })
})
