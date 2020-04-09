import requests

def pretty_print_request(request):
    print( '\n{}\n{}\n\n{}\n\n{}\n'.format(
        '-----------Request----------->',
        request.method + ' ' + request.url,
        '\n'.join('{}: {}'.format(k, v) for k, v in request.headers.items()),
        request.body)
    )

def pretty_print_response(response):
    print('\n{}\n{}\n\n{}\n\n{}\n'.format(
        '<-----------Response-----------',
        'Status code:' + str(response.status_code),
        '\n'.join('{}: {}'.format(k, v) for k, v in response.headers.items()),
        response.text)
    )

def test_get_url():  
    r = requests.get("https://xkcd.com/353")
    assert r.ok == True
    assert r.status_code == 200

def test_get_with_url_param(base_url):
    url = base_url + "/get"
    url_params = {"page": 2, "count":17}
    r = requests.get(url, params=url_params)
    assert r.url == url + "?page=2&count=17"
    

def test_post_new_user(base_url):
    payload = {"page": "longtran", "password": "mypass"}
    response = requests.post(base_url + "/post", data=payload)
    response_body = response.json()
    assert response_body["form"] == payload

def test_get_with_authentication(base_url):
    r = requests.get(base_url + "/basic-auth/longtran/mypass", auth=("longtran", "mypass"))
    assert r.status_code == 204

def test_put_existed_user(base_url):
    payload = {"page": "longtran", "password": "mynewpass"}
    response = requests.put(base_url + "/put", data=payload)
    response_body = response.json()
    assert response_body["form"]["password"] == "mynewpass"