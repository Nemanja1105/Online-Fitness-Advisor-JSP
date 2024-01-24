
					function sendEmail() {
						let elements = document.getElementById('emailForm').elements;
						console.log(elements);
						let obj = { to: elements.client.value, message: elements.descriptionInput.value };
						let subject = elements.subject.value;
						if (subject)
							obj['subject'] = subject;
						let fileInput = document.getElementById('formFile');
						if (fileInput.files.length > 0) {
							const formData = new FormData();
							formData.append("image", fileInput.files[0]);
							let http = new XMLHttpRequest();
							http.open('POST', 'http://localhost:9001/api/v1/images', true);
							http.onreadystatechange = function () {
								if (http.readyState == 4 && http.status == 201) {
									obj['attachmentId'] = parseInt(http.responseText);
									send(obj);
								}
								else {
									if (http.readyState == 4)
										showNotification('Greska prilikom slanja emaila', false);
								}
							}
							http.send(formData);
						}
						else
							send(obj);

					}
						

					function send(request) {
						let http = new XMLHttpRequest();
						http.open('POST', 'http://localhost:9001/api/v1/email', true);
						http.onreadystatechange = function () {
							if (http.readyState == 4 && http.status == 200) {
								window.location.href = "messages.jsp?action=send"
							}
							else {
								if (http.readyState == 4)
									showNotification('Greska prilikom slanja emaila', false);
							}
						}
						http.setRequestHeader("Content-Type", "application/json");
						http.send(JSON.stringify(request));
					}

				