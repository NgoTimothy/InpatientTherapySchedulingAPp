﻿using System;

namespace InpatientTherapySchedulingProgram.Exceptions.UserExceptions
{
    [Serializable]
    public class UserDoesNotExistException : Exception
    {
        public UserDoesNotExistException()
        { }

        public UserDoesNotExistException(string message)
            : base(message)
        { }

        public UserDoesNotExistException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
