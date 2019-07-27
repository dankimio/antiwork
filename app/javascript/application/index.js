import SVGInject from '@iconfu/svg-inject'

document.addEventListener('DOMContentLoaded', () => {
  // SVGInject
  let injectables = document.querySelectorAll('img.injectable')
  if (injectables) {
    SVGInject(injectables)
  }
  window.reinjectSvgs = () => SVGInject(document.querySelectorAll('img.injectable'))
})
