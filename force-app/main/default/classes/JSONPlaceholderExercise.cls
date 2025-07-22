public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
public class Post {
		public String title;
		public String body;
		public Integer userid;
        public Integer id;		
	}

    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'GET'
        // 4. Send the request and get the response
        // 5. Return the response body as string
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setHeader('Content-type', 'application/json');
        request.setMethod('GET');

        HttpResponse response = http.send(request);
              
       String returnBody = checkResponseStatus(response) ? response.getBody() : 'Error: ' + response.getStatus();

        return returnBody;
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */

    
    public static String createPost(String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts'
        // 3. Set the HTTP method to 'POST'
        // 4. Create a JSON string with the post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
       
        Http http = new Http();
       
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts');
        request.setHeader('Content-type', 'application/json');
        request.setMethod('POST');

        
        Post post = new Post();
        post.title = title;
        post.body = body;
        post.userid = userid;

        //System.debug(JSON.serialize(post));
        request.setBody(JSON.serialize(post));

        HttpResponse response = http.send(request);

       // System.debug('Status: ' + response.getStatus());

        String returnBody = checkResponseStatus(response) ? response.getBody() : 'Error: ' + response.getStatus();
       

        return returnBody;
    }
    
   
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PUT'
        // 4. Create a JSON string with the updated post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/'+ postId);
        request.setHeader('Content-type', 'application/json');
        request.setMethod('PUT');

        
        Post post = new Post();
        post.title = title;
        post.body = body;
        post.userid = userid;
        post.id = postId;

        //System.debug(JSON.serialize(post));
        request.setBody(JSON.serialize(post));
        HttpResponse response = http.send(request);

       String returnBody = checkResponseStatus(response) ? response.getBody() : 'Error: ' + response.getStatus();
       

        return returnBody;
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PATCH'
        // 4. Create a JSON string with only the title
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setHeader('Content-type', 'application/json');
        request.setMethod('PATCH');

        POST post = new POST();
        post.title = title;

        request.setBody(JSON.serialize(post));
        HttpResponse response = http.send(request);

        String returnBody = checkResponseStatus(response) ? response.getBody() : 'Error: ' + response.getStatus();

        return returnBody;
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'DELETE'
        // 4. Send the request and get the response
        // 5. Return the response status code
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(BASE_URL + '/posts/' + postId);
        request.setHeader('Content-type', 'application/json');
        request.setMethod('DELETE');

        HttpResponse response = http.send(request);

        return response.getStatusCode();
    }


    //Checks the status code to verify a successful callout
 public static Boolean checkResponseStatus(HttpResponse response)

    {
        System.debug('Status Code: ' + response.getStatusCode());
        System.debug('Status: ' + response.getStatus());
        System.debug('Body: ' + response.getBody());

        Boolean retValue = (response.getStatusCode() >= 200 && response.getStatusCode() <=299) ?  true :  false;

        return retValue;        
    }

} 