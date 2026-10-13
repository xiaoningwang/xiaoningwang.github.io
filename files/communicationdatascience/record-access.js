"use strict";
(() => {
  const form = document.querySelector('form');
  const input = document.querySelector('#password');
  const message = document.querySelector('#message');
  const frame = document.querySelector('#records');
  const lock = document.querySelector('#lock');
  const gate = document.querySelector('#gate');
  const bytes = value => Uint8Array.from(atob(value), c => c.charCodeAt(0));
  form.addEventListener('submit', async event => {
    event.preventDefault();
    const button = form.querySelector('button');
    button.disabled = true;
    message.textContent = '正在解锁…';
    try {
      if (!window.crypto?.subtle) throw new Error('unsupported');
      const response = await fetch(document.body.dataset.payload, {cache: 'no-store'});
      if (!response.ok) throw new Error('network');
      const payload = await response.json();
      const material = await crypto.subtle.importKey('raw', new TextEncoder().encode(input.value), 'PBKDF2', false, ['deriveKey']);
      const key = await crypto.subtle.deriveKey({name:'PBKDF2',salt:bytes(payload.salt),iterations:payload.iterations,hash:'SHA-256'}, material, {name:'AES-GCM',length:256}, false, ['decrypt']);
      const plain = await crypto.subtle.decrypt({name:'AES-GCM',iv:bytes(payload.iv)}, key, bytes(payload.ciphertext));
      frame.srcdoc = new TextDecoder('utf-8', {fatal:true}).decode(plain);
      input.value = '';
      message.textContent = '';
      gate.hidden = true;
      frame.hidden = false;
      lock.hidden = false;
    } catch (error) {
      message.textContent = error.message === 'unsupported' ? '请通过 HTTPS 使用新版浏览器访问。' : error.message === 'network' ? '记录加载失败，请稍后重试。' : '密码不正确或记录无法解锁，请重试。';
    } finally { button.disabled = false; }
  });
  lock.addEventListener('click', () => {
    frame.srcdoc = '';
    frame.hidden = true;
    lock.hidden = true;
    gate.hidden = false;
    input.value = '';
    input.focus();
  });
  window.addEventListener('pagehide', () => { frame.srcdoc = ''; input.value = ''; });
})();
