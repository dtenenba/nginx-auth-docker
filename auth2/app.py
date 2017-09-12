import sys
from functools import wraps

import flask

import ldap3_auth

app = flask.Flask(__name__)



def check_auth(username, password):
    """This function is called to check if a username /
    password combination is valid.
    """
    # return username == 'admin' and password == 'secret'
    return ldap3_auth.authenticate(username, password)

def authenticate():
    """Sends a 401 response that enables basic auth"""
    return flask.Response(
    'Could not verify your access level for that URL.\n'
    'You have to login with proper credentials', 401,
    {'WWW-Authenticate': 'Basic realm="Login Required"'})

def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth = flask.request.authorization
        if not auth or not check_auth(auth.username, auth.password):
            return authenticate()
        return f(*args, **kwargs)
    return decorated


@app.route('/auth')
@requires_auth
def hello_world2():
    resp = flask.make_response('get all authy with it', 200)
    auth = flask.request.authorization
    resp.headers['X-Remote-User'] = auth.username
    print("helloooo!")
    print("I think the username is {}".format(auth.username))
    sys.stdout.flush()
    # return 'get all authy and shit', 200
    return resp
