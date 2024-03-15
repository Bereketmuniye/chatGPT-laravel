<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\RequestException;
use Throwable;

class ChatController extends Controller
{
    /**
     * @param Request $request
     * @return string
     */
    public function __invoke(Request $request): string
    {

        try {
            $response = Http::withHeaders([
                "Content-Type" => "application/json",
                "Authorization" => "Bearer " . env('CHAT_GPT_KEY')
            ])->post('https://api.openai.com/v1/chat/completions', [
                "model" => $request->post('model'),
                "messages" => [
                    [
                        "role" => "user",
                        "content" => $request->post('content')
                    ]
                ],
                "temperature" => 0,
                "max_tokens" => 5000
            ]);

            // Check for any request errors
            $response->throw();

            // Decode the response body
            $responseData = $response->json();

            // Return the response content
            return $responseData['choices'][0]['message']['content'];
        } catch (RequestException $e) {
            // Handle HTTP request errors
            return "HTTP Request Error: " . $e->getMessage();
        } catch (Throwable $e) {
            // Handle other types of errors
            return "An error occurred: " . $e->getMessage();
        }
    }
}
